package model_test

import (
	"testing"

	"twitter-bookmarker/internal/model"
)

// TestDeriveName pins the slug→display-name rule used whenever a collection has
// no stored name of its own.
func TestDeriveName(t *testing.T) {
	tests := []struct {
		slug string
		want string
	}{
		{slug: "ai-and-llm", want: "AI And LLM"},
		{slug: "ai", want: "AI"},
		{slug: "llm", want: "LLM"},
		{slug: "linux", want: "Linux"},
		{slug: "design", want: "Design"},
		{slug: "linux-stuff", want: "Linux Stuff"},
		{slug: "a_b_c", want: "A B C"},
		{slug: "my--cat__name", want: "My Cat Name"},
		{slug: "web3", want: "Web3"},
		// Only the named initialisms are upper-cased; everything else is ordinary
		// title case.
		{slug: "os", want: "Os"},
		{slug: "chisato-nsfw", want: "Chisato Nsfw"},
		// A slug already in title case is lower-cased in the tail, which is
		// unreachable through the slug pattern but must not panic.
		{slug: "WEB", want: "Web"},
	}
	for _, test := range tests {
		t.Run(test.slug, func(t *testing.T) {
			if got := model.DeriveName(test.slug); got != test.want {
				t.Errorf("DeriveName(%q) = %q, want %q", test.slug, got, test.want)
			}
		})
	}
}
