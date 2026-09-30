package model

import (
	"strings"
	"unicode"
)

// initialisms are the slug tokens whose display form is upper case: `ai-and-llm`
// becomes "AI And LLM", not "Ai And Llm". A slug only contains lower-case
// characters, so an exact match is enough.
var initialisms = map[string]string{
	"ai":  "AI",
	"llm": "LLM",
}

// DeriveName turns a collection slug into a human-readable name from the slug
// alone: `-` runs collapse to a space and every word is title-cased.
//
// It is only a fallback. A collection normally carries the name the user typed,
// which the extension sends with each save; this is what a collection saved to by
// a version of the extension that sends no name gets instead. Nothing consults
// extension configuration to compute it.
func DeriveName(slug string) string {
	words := strings.FieldsFunc(slug, func(r rune) bool { return r == '-' || r == '_' })
	for i, word := range words {
		if upper, ok := initialisms[word]; ok {
			words[i] = upper
			continue
		}
		words[i] = titleWord(word)
	}
	return strings.Join(words, " ")
}

// titleWord upper-cases the first rune and lower-cases the rest.
func titleWord(word string) string {
	runes := []rune(word)
	if len(runes) == 0 {
		return word
	}
	runes[0] = unicode.ToUpper(runes[0])
	for i := 1; i < len(runes); i++ {
		runes[i] = unicode.ToLower(runes[i])
	}
	return string(runes)
}
