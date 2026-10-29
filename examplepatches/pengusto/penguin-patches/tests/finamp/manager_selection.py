"""Select and verify patch rows through fresh Manager UI, including scrolled rows."""


def configure_selection(ui, names, mask):
    ordered = sorted(names.items(), key=lambda entry: entry[1])

    def row(name, direction='up'):
        for _ in range(8):
            root, _ = ui.dump()
            # An empty intermediate selection disables Patch; its visible
            # bounds still delimit the safe area for selecting another row.
            patch = ui.find(root, 'Patch', class_name='android.widget.TextView', allow_disabled=True)
            parents = {child: parent for parent in root.iter() for child in parent}
            footer = patch
            while footer.get('clickable') != 'true' and footer in parents:
                footer = parents[footer]
            footer_top = ui.bounds(footer, allow_disabled=True)[1]
            controls = [ui.bounds(node)[3] for node in root.iter('node')
                        if node.get('content-desc') in ('Enable all', 'Disable all')]
            content_top = max(controls, default=0)
            try:
                caption = ui.find(root, name, class_name='android.widget.TextView')
                _, top, _, bottom = ui.bounds(caption)
            except (RuntimeError, ValueError):
                ui.scroll(direction)
                continue
            if top < content_top or bottom > footer_top:
                ui.scroll('down' if top < content_top else 'up')
                continue
            states = [node.get('content-desc') for node in root.iter('node')
                      if node.get('content-desc') in (name + ', Enabled', name + ', Disabled')]
            if len(states) != 1:
                raise RuntimeError('Missing distinct visible patch state: ' + name)
            return states[0]
        raise RuntimeError('Patch row could not be brought clear of Manager controls: ' + name)

    def states_in(root):
        result = {}
        for _, name in ordered:
            states = [node.get('content-desc') for node in root.iter('node')
                      if node.get('content-desc') in (name + ', Enabled', name + ', Disabled')]
            if len(states) == 1:
                result[name] = states[0]
        return result

    row(ordered[0][1], 'down')
    current = states_in(ui.dump()[0])
    for bit, name in ordered:
        expected = name + (', Enabled' if mask & bit else ', Disabled')
        if current.get(name) != expected:
            row(name)  # A readable semantic state alone is not a safe tap target.
            ui.tap(name, class_name='android.widget.TextView')
            current = states_in(ui.dump()[0])
            if current.get(name) != expected:
                raise AssertionError('Patch toggle did not apply: ' + name)

    verified = states_in(ui.dump()[0])
    if len(verified) != len(names):
        row(ordered[0][1], 'down')
        verified.update(states_in(ui.dump()[0]))
        for _, name in ordered:
            if name not in verified:
                verified[name] = row(name)
    for bit, name in ordered:
        if verified[name] != name + (', Enabled' if mask & bit else ', Disabled'):
            raise AssertionError('Completed selection changed unexpectedly: ' + name)
    selected = next(name for bit, name in ordered if mask & bit)
    row(selected, 'down')  # Keep a selected row visible in the acceptance capture.
    root, _ = ui.dump()
    ui.find(root, f'{sum(bool(mask & bit) for bit in names)}/{len(names)}', class_name='android.widget.TextView')
    ui.find(root, '0/5', class_name='android.widget.TextView')
    return verified
