/**
 * Appends the Morphe Manager source link to every release note.
 */
module.exports = {
  generateNotes() {
    const repository = process.env.GITHUB_REPOSITORY || 'na-x-ril/onlynazril-patches';
    return `### [Add to Morphe](https://morphe.software/add-source?github=${repository})`;
  },
};
