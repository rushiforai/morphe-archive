import type { ReleaseChangeItem, ReleaseInfo } from './types';

export function parseChangelogSection(markdown: string): ReleaseChangeItem[] {
  const items: ReleaseChangeItem[] = [];
  const lines = markdown.split('\n');
  let currentSectionType: 'feat' | 'fix' | 'bump' | 'perf' | 'other' = 'other';

  for (const line of lines) {
    const trimmed = line.trim();
    if (trimmed.startsWith('### ')) {
      const heading = trimmed.toLowerCase();
      if (heading.includes('feature') || heading.includes('feat') || heading.includes('✨')) {
        currentSectionType = 'feat';
      } else if (heading.includes('fix') || heading.includes('bug') || heading.includes('🐛')) {
        currentSectionType = 'fix';
      } else if (heading.includes('app support') || heading.includes('bump') || heading.includes('🚀')) {
        currentSectionType = 'bump';
      } else if (heading.includes('improvement') || heading.includes('perf') || heading.includes('🔧')) {
        currentSectionType = 'perf';
      } else {
        currentSectionType = 'other';
      }
      continue;
    }

    if (trimmed.startsWith('* ') || trimmed.startsWith('- ')) {
      const rawText = trimmed.replace(/^[*\-]\s+/, '');
      // Match scope: **scope:** message ([hash](url))
      const scopeMatch = rawText.match(/^\*\*([^*:]+)(?::\*\*|\*\*:)\s*(.*)$/);
      let scope: string | null = null;
      let remainder = rawText;
      if (scopeMatch) {
        scope = scopeMatch[1].trim();
        remainder = scopeMatch[2].trim();
      }

      // Match commit link: ([hash](url))
      const commitMatch = remainder.match(/\(\[([a-f0-9]{7,})\]\((https:\/\/[^)]+)\)\)/i);
      let hash: string | null = null;
      let commitUrl: string | null = null;
      let description = remainder;

      if (commitMatch) {
        hash = commitMatch[1];
        commitUrl = commitMatch[2];
        description = remainder.replace(commitMatch[0], '').trim();
      }

      items.push({
        type: currentSectionType,
        scope,
        description,
        hash,
        commitUrl,
      });
    }
  }

  return items;
}

export function parseReleaseInfo(bundleJson: {
  version: string;
  created_at: string;
  description: string;
  download_url: string;
}): ReleaseInfo {
  const recentChanges = parseChangelogSection(bundleJson.description || '');
  return {
    version: bundleJson.version,
    releaseDate: bundleJson.created_at ? formatDisplayDate(bundleJson.created_at) : 'Recent',
    downloadUrl: bundleJson.download_url || '',
    rawChangelog: bundleJson.description || '',
    recentChanges,
  };
}

export function formatDisplayDate(dateStr: string): string {
  if (!dateStr) return 'Recent';
  const datePart = dateStr.split('T')[0];
  const [yearStr, monthStr, dayStr] = datePart.split('-');
  const year = parseInt(yearStr, 10);
  const month = parseInt(monthStr, 10);
  const day = parseInt(dayStr, 10);
  if (isNaN(year) || isNaN(month) || isNaN(day)) return dateStr;
  const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  return `${months[month - 1]} ${day}, ${year}`;
}
