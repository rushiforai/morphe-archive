/* Copyright 2026 Morphe. Adapted for YTAfterglow; see docs/long-press-tools.md and NOTICE.
 * Native text-content bridge derived from Morphe Copy text, commit
 * 44031c561ea048c8f196877f30a49c13bfd6afb6. Not an official Morphe file.
 * Portions provided "AS IS" by the Morphe software project, without express or implied
 * warranties, including merchantability and fitness for a particular purpose.
 */
package app.afterglow.extension.menus;

import android.view.View;
import java.util.List;

/** Added to native ComponentHost; avoids reflection and packaging native class stubs. */
public interface LongPressTextHost {
    List<CharSequence> afterglow_textItems();
    View.OnLongClickListener afterglow_longPressListener();
}
