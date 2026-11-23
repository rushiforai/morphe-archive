import os
import re

for root, dirs, files in os.walk('temp_decompiled/res/xml'):
    for f in files:
        if 'voice' in f.lower() or 'dictation' in f.lower():
            print("Found xml:", f)
