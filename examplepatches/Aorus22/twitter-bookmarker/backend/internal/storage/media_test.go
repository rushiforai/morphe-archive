package storage_test

import (
	"encoding/json"
	"reflect"
	"testing"

	"twitter-bookmarker/internal/storage"
)

func TestNormalizeMedia(t *testing.T) {
	tests := []struct {
		name string
		in   []string
		want []string
	}{
		{
			name: "keeps pbs media urls in order",
			in: []string{
				"https://pbs.twimg.com/media/AAA.jpg",
				"https://pbs.twimg.com/media/BBB.jpg",
			},
			want: []string{
				"https://pbs.twimg.com/media/AAA.jpg",
				"https://pbs.twimg.com/media/BBB.jpg",
			},
		},
		{
			name: "strips the sizing query and rebuilds the extension from format",
			in:   []string{"https://pbs.twimg.com/media/CCC?format=jpg&name=small"},
			want: []string{"https://pbs.twimg.com/media/CCC.jpg"},
		},
		{
			name: "keeps an extension-less path when no usable format is present",
			in:   []string{"https://pbs.twimg.com/media/DDD?name=large"},
			want: []string{"https://pbs.twimg.com/media/DDD"},
		},
		{
			name: "keeps video thumbnails",
			in: []string{
				"https://pbs.twimg.com/amplify_video_thumb/123/img/hash.jpg",
				"https://pbs.twimg.com/tweet_video_thumb/456.jpg",
			},
			want: []string{
				"https://pbs.twimg.com/amplify_video_thumb/123/img/hash.jpg",
				"https://pbs.twimg.com/tweet_video_thumb/456.jpg",
			},
		},
		{
			name: "drops duplicates, non-media hosts and non-https schemes",
			in: []string{
				"https://pbs.twimg.com/media/AAA.jpg",
				"https://pbs.twimg.com/media/AAA.jpg?name=small",
				"http://pbs.twimg.com/media/BBB.jpg",
				"https://example.com/media/CCC.jpg",
				"https://pbs.twimg.com/card_img/123/abc.jpg",
				"https://pbs.twimg.com/profile_images/1/avatar.jpg",
				"not a url",
				"  ",
			},
			want: []string{"https://pbs.twimg.com/media/AAA.jpg"},
		},
		{
			name: "caps the list at MaxMedia",
			in: []string{
				"https://pbs.twimg.com/media/1.jpg",
				"https://pbs.twimg.com/media/2.jpg",
				"https://pbs.twimg.com/media/3.jpg",
				"https://pbs.twimg.com/media/4.jpg",
				"https://pbs.twimg.com/media/5.jpg",
				"https://pbs.twimg.com/media/6.jpg",
				"https://pbs.twimg.com/media/7.jpg",
				"https://pbs.twimg.com/media/8.jpg",
				"https://pbs.twimg.com/media/9.jpg",
				"https://pbs.twimg.com/media/10.jpg",
			},
			want: []string{
				"https://pbs.twimg.com/media/1.jpg",
				"https://pbs.twimg.com/media/2.jpg",
				"https://pbs.twimg.com/media/3.jpg",
				"https://pbs.twimg.com/media/4.jpg",
				"https://pbs.twimg.com/media/5.jpg",
				"https://pbs.twimg.com/media/6.jpg",
				"https://pbs.twimg.com/media/7.jpg",
				"https://pbs.twimg.com/media/8.jpg",
			},
		},
		{name: "nothing in, nothing out", in: nil, want: []string{}},
	}

	for _, tc := range tests {
		t.Run(tc.name, func(t *testing.T) {
			got := storage.NormalizeMedia(tc.in)
			if got == nil {
				t.Fatal("NormalizeMedia returned nil; it must be JSON-encodable as []")
			}
			if !reflect.DeepEqual(got, tc.want) {
				t.Errorf("NormalizeMedia() = %#v, want %#v", got, tc.want)
			}
			encoded, err := json.Marshal(got)
			if err != nil {
				t.Fatalf("json.Marshal() error = %v", err)
			}
			if len(tc.in) == 0 && string(encoded) != "[]" {
				t.Errorf("empty media encoded as %s, want []", encoded)
			}
		})
	}
}
