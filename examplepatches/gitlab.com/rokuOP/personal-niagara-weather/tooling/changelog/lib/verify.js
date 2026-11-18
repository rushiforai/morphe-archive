import getError from './get-error.js';
import resolveConfig from './resolve-config.js';

const isNonEmptyString = (value) => typeof value === 'string' && value.trim();

const VALIDATORS = {
  changelogFile: isNonEmptyString,
  changelogTitle: isNonEmptyString,
  releaseJson: () => true,
};

export default function verify(pluginConfig) {
  const options = resolveConfig(pluginConfig);

  const errors = Object.entries(options).reduce(
    (errors, [option, value]) =>
      value !== undefined && value !== null && !VALIDATORS[option](value)
        ? [...errors, getError(`EINVALID${option.toUpperCase()}`, {[option]: value})]
        : errors,
    []
  );

  if (errors.length > 0) {
    throw new AggregateError(errors, 'Invalid changelog configuration');
  }
}
