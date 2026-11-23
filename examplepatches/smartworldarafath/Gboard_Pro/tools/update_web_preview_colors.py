with open('web_preview/index.html', 'r', encoding='utf-8') as f:
    c = f.read()

# Replace blush_lilac light values
c = c.replace("bg: '#F8F2FA',", "bg: '#F7EFFA',")
c = c.replace("primary: '#7E57C2',", "primary: '#542983',")
c = c.replace("primaryContainer: '#EBDDFB',", "primaryContainer: '#EBD7FA',")
c = c.replace("switchTrack: '#7E57C2',", "switchTrack: '#542983',")
c = c.replace("textPrimary: '#1D162B',", "textPrimary: '#24152F',")
c = c.replace("textSecondary: '#5B4F6E',", "textSecondary: '#5F4B6E',")

# Replace cotton_candy light values
c = c.replace("bg: '#FDF2F7',", "bg: '#FDE7E9',")
c = c.replace("primary: '#D81B60',", "primary: '#B80058',")
c = c.replace("primaryContainer: '#F8BBD0',", "primaryContainer: '#F6B0CA',")
c = c.replace("switchTrack: '#D81B60',", "switchTrack: '#B80058',")
c = c.replace("textPrimary: '#2B121C',", "textPrimary: '#2D121B',")
c = c.replace("textSecondary: '#6B4354',", "textSecondary: '#6D4352',")

# Replace sunset_peach light values
c = c.replace("bg: '#FFF5F2',", "bg: '#FDE8E7',")
c = c.replace("primary: '#E64A19',", "primary: '#D35A2D',")
c = c.replace("primaryContainer: '#FFCCBC',", "primaryContainer: '#FD987C',")
c = c.replace("switchTrack: '#E64A19',", "switchTrack: '#D35A2D',")
c = c.replace("textPrimary: '#2D1610',", "textPrimary: '#2D1610',")
c = c.replace("textSecondary: '#5F3E35',", "textSecondary: '#6E443A',")

# Replace fresh_mint light values
c = c.replace("bg: '#F2F8F5',", "bg: '#EFF5F5',")
c = c.replace("primary: '#00796B',", "primary: '#046665',")
c = c.replace("primaryContainer: '#C8E6C9',", "primaryContainer: '#D4FAEF',")
c = c.replace("switchTrack: '#00796B',", "switchTrack: '#046665',")
c = c.replace("textPrimary: '#10241E',", "textPrimary: '#0E1F1E',")
c = c.replace("textSecondary: '#3E5B51',", "textSecondary: '#3F5C5A',")

# Update button swatches
c = c.replace('#7E57C2;', '#542983;')
c = c.replace('#D81B60;', '#B80058;')
c = c.replace('#E64A19;', '#D35A2D;')
c = c.replace('#00796B;', '#046665;')

with open('web_preview/index.html', 'w', encoding='utf-8') as f:
    f.write(c)
print('Updated web_preview/index.html with screenshot-matched colors')
