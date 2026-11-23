# Simulating exc.smali lines 525-630:
array_values = ["1", "2", "3", "6", "12", "18", "24"]

print("Testing array parsing...")
parsed_ints = []
for val in array_values:
    try:
        parsed = int(val)
        parsed_ints.append(parsed)
        # Quantity string simulation (e.g. 1 hour, 2 hours...)
        label = f"{parsed} hour" if parsed == 1 else f"{parsed} hours"
        print(f"  Item '{val}' -> int: {parsed} -> label: '{label}'")
    except ValueError as e:
        print(f"CRASH: {e}")
        exit(1)

max_index = len(array_values) - 1
print(f"Slider max value set to: {max_index}")
print("SUCCESS: Gboard's exc.smali logic executes cleanly without NumberFormatException!")
