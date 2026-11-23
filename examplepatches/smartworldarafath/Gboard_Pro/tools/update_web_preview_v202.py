with open('web_preview/index.html', 'r', encoding='utf-8') as f:
    html = f.read()

# Update version title
html = html.replace('Gboard Pro v2.0.1 (Beta)', 'Gboard Pro v2.0.2 (Beta Dynamic Colors)')
html = html.replace('v2.0.1', 'v2.0.2')

# Update theme palettes in JS
old_palettes = '''        const palettes = {
            blush_lilac: {
                bg: '#F8F2FA',
                card: '#FFFFFF',
                cardBorder: '#E8DDF0',
                text: '#1D162B',
                sub: '#5B4F6E',
                accent: '#7E57C2',
                accentCont: '#EBDDFB',
                onAccentCont: '#2A0054',
                desc: 'Showcase Light Pink / Pastel Lilac'
            },
            cotton_candy: {
                bg: '#FDF2F7',
                card: '#FFFFFF',
                cardBorder: '#F5DCE7',
                text: '#2B121C',
                sub: '#6B4354',
                accent: '#D81B60',
                accentCont: '#F8BBD0',
                onAccentCont: '#4A0023',
                desc: 'Pastel Rose Pink & Soft Sky'
            },
            rainbow: {
                bg: '#FFF8F6',
                card: '#FFFFFF',
                cardBorder: '#F5DDD5',
                text: '#2D1610',
                sub: '#5F3E35',
                accent: '#E64A19',
                accentCont: '#FFCCBC',
                onAccentCont: '#3E0F04',
                desc: 'Sunset Peach & Apricot Glow'
            },
            botanical: {
                bg: '#F4FBF7',
                card: '#FFFFFF',
                cardBorder: '#DCECE3',
                text: '#0A261F',
                sub: '#2E5349',
                accent: '#00796B',
                accentCont: '#C8E6C9',
                onAccentCont: '#00382F',
                desc: 'Fresh Botanical Sage & Mint'
            },
            default: {
                bg: '#F1F3F4',
                card: '#FFFFFF',
                cardBorder: '#E0E3E7',
                text: '#1A1C1E',
                sub: '#44474E',
                accent: '#1A73E8',
                accentCont: '#D3E3FD',
                onAccentCont: '#041E49',
                desc: 'System Dynamic Material You'
            }
        };'''

new_palettes = '''        const palettes = {
            blush_lilac: {
                bg: '#F7EFFA',
                card: '#FFFFFF',
                cardBorder: '#EADCF7',
                text: '#24152F',
                sub: '#5F4B6E',
                accent: '#542983',
                accentCont: '#EBD7FA',
                onAccentCont: '#24152F',
                desc: 'Blush Lilac - Soft pastel lilac with deep royal purple accents (Screenshot matched)'
            },
            cotton_candy: {
                bg: '#FDE7E9',
                card: '#FFFFFF',
                cardBorder: '#F7CDD6',
                text: '#2D121B',
                sub: '#6D4352',
                accent: '#B80058',
                accentCont: '#F6B0CA',
                onAccentCont: '#2D121B',
                desc: 'Cotton Candy - Soft powder rose with vivid raspberry magenta accents (Screenshot matched)'
            },
            sunset_peach: {
                bg: '#FDE8E7',
                card: '#FFFFFF',
                cardBorder: '#F7CFBE',
                text: '#2D1610',
                sub: '#6E443A',
                accent: '#D35A2D',
                accentCont: '#FD987C',
                onAccentCont: '#2D1610',
                desc: 'Sunset Peach - Warm peach with rich terracotta burnt orange accents (Screenshot matched)'
            },
            fresh_mint: {
                bg: '#EFF5F5',
                card: '#FFFFFF',
                cardBorder: '#CDE7E1',
                text: '#0E1F1E',
                sub: '#3F5C5A',
                accent: '#046665',
                accentCont: '#D4FAEF',
                onAccentCont: '#0E1F1E',
                desc: 'Fresh Mint - Pale mint sage with deep pine teal accents (Screenshot matched)'
            },
            default: {
                bg: '#F1F3F4',
                card: '#FFFFFF',
                cardBorder: '#E0E3E7',
                text: '#1A1C1E',
                sub: '#44474E',
                accent: '#1A73E8',
                accentCont: '#D3E3FD',
                onAccentCont: '#041E49',
                desc: 'Default - System Dynamic Material You Monet'
            }
        };'''

if old_palettes in html:
    html = html.replace(old_palettes, new_palettes)
    print("Replaced palettes in index.html")
else:
    print("Old palettes block not exactly matched, inspecting...")

with open('web_preview/index.html', 'w', encoding='utf-8') as f:
    f.write(html)
print("Updated web_preview/index.html")
