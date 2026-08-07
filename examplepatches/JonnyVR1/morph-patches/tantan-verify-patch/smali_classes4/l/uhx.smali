.class public Ll/uhx;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MbtiInfo;
    .locals 4

    .line 1
    const-string v0, "mbti_config"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/data/MbtiConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 19
    .line 20
    const-string v2, "{\n  \"mbtis\": [\n    {\n      \"key\": \"ENFP\",\n      \"pic\": \"https://auto.tancdn.com/v1/images/eyJpZCI6IlFMNk9LQlZYVEEyUEUyTlFDUUJDSkpTUE1RNllLVjE0IiwidyI6MTgwLCJoIjoxODAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3OTIyMjg1NTA4NjE2MDIwMDIxfQ.png\",\n      \"character\": \"\u7ade\u9009\u8005\",\n      \"labels\": [\n        \"\u6d6a\u6f2b\u4e3b\u4e49\",\n        \"\u4f53\u8d34\",\n        \"\u7231\u5403\u918b\",\n        \"\u5206\u4eab\u6b32\u7206\u68da\",\n        \"\u5f02\u6027\u7f18\u5f88\u597d\"\n      ],\n      \"desc\": \"\u505a\u53ea\u5feb\u4e50\u5c0f\u72d7\uff0c\u6709\u4ec0\u4e48\u4e0d\u597d\u5462\uff1f\",\n      \"matchScores\": [\n        {\n          \"key\": \"INFP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENFP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"INFJ\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ENFJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"INTJ\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ENTJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"INTP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENTP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ISFP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ESFP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ISTP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ESTP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ISFJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ESFJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ISTJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ESTJ\",\n          \"matchScore\": 60\n        }\n      ]\n    },\n    {\n      \"key\": \"INTJ\",\n      \"character\": \"\u5efa\u7b51\u5e08\",\n      \"pic\": \"https://auto.tancdn.com/v1/images/eyJpZCI6IjRKTE1ORUNEN09UVVFOQkE1QTVQM01YUUNTQ0JWQjE0IiwidyI6MTgwLCJoIjoxODAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4NDI0MTA4MDQ0NDgyOTYxNTI5fQ.png\",\n      \"labels\": [\n        \"\u5b8c\u7f8e\u4e3b\u4e49\u8005\",\n        \"\u53ef\u9760\u7684\u4f34\u4fa3\",\n        \"\u505a\u7684\u6bd4\u8bf4\u7684\u591a\",\n        \"\u4e13\u6ce8\u5171\u540c\u76ee\u6807\",\n        \"\u62e9\u5076\u6807\u51c6\u6bd4\u8f83\u82db\u523b\"\n      ],\n      \"desc\": \"\u90a3\u4e9b\u6740\u4e0d\u6b7b\u6211\u7684\uff0c\u53ea\u4f1a\u8ba9\u6211\u53d8\u66f4\u5f3a\u3002\",\n      \"matchScores\": [\n        {\n          \"key\": \"INFP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENFP\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"INFJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENFJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"INTJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENTJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"INTP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENTP\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ISFP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ESFP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ISTP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ESTP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ISFJ\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ESFJ\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ISTJ\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ESTJ\",\n          \"matchScore\": 70\n        }\n      ]\n    },\n    {\n      \"key\": \"INFJ\",\n      \"character\": \"\u63d0\u5021\u8005\",\n      \"pic\": \"https://auto.tancdn.com/v1/images/eyJpZCI6IjdUSTZXQkNEQlJBRkZCMzdSWU9TT0dKSFRIM0tPUjE0IiwidyI6MTgwLCJoIjoxODAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4Njk2NTg0MzQzODgzODk5NDgxfQ.png\",\n      \"labels\": [\n        \"\u8ffd\u6c42\u5b8c\u7f8e\u4f34\u4fa3\",\n        \"\u5171\u60c5\u529b\u5f3a\",\n        \"\u5305\u5bb9\",\n        \"\u535a\u7231\u65e0\u79c1\",\n        \"\u5bb3\u6015\u53d7\u4f24\"\n      ],\n      \"desc\": \"\u522b\u6d3b\u5728\u522b\u4eba\u7684\u671f\u671b\u4e0b\u3002\",\n      \"matchScores\": [\n        {\n          \"key\": \"INFP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENFP\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"INFJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENFJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"INTJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENTJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"INTP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENTP\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ISFP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ESFP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ISTP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ESTP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ISFJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ESFJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ISTJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ESTJ\",\n          \"matchScore\": 60\n        }\n      ]\n    },\n    {\n      \"key\": \"INTP\",\n      \"character\": \"\u903b\u8f91\u5b66\u5bb6\",\n      \"pic\": \"https://auto.tancdn.com/v1/images/eyJpZCI6IlhXN1JCNVpJTFJCSE9ZTVBENUIySDZQU1AyRDZHSTE0IiwidyI6MTgwLCJoIjoxODAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4Nzg1NjAxMDk5NTA2MTUxOTk1fQ.png\",\n      \"labels\": [\n        \"\u770b\u91cd\u5185\u5728\u7684\u5951\u5408\",\n        \"\u7ec6\u8282\u63a7\",\n        \"\u6162\u70ed\",\n        \"\u7ec6\u6c34\u957f\u6d41\u7684\u7231\u60c5\",\n        \"\u4e0d\u559c\u6b22\u88ab\u675f\u7f1a\"\n      ],\n      \"desc\": \"\u77e5\u8bc6\uff0c\u5c31\u662f\u529b\u91cf\u3002\",\n      \"matchScores\": [\n        {\n          \"key\": \"INFP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENFP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"INFJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENFJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"INTJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENTJ\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"INTP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENTP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ISFP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ESFP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ISTP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ESTP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ISFJ\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ESFJ\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ISTJ\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ESTJ\",\n          \"matchScore\": 100\n        }\n      ]\n    },\n    {\n      \"key\": \"ENTP\",\n      \"character\": \"\u8fa9\u8bba\u5bb6\",\n      \"pic\": \"https://auto.tancdn.com/v1/images/eyJpZCI6Ik5WSDczTUo0Vk03WFBQSFdMSFhCSkVTWUs1V1hSRzE0IiwidyI6MTgwLCJoIjoxODAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3MTI1NDY1OTk3MTY0NTA2MTc5fQ.png\",\n      \"labels\": [\n        \"\u60c5\u7eea\u4ef7\u503c\u62c9\u6ee1\",\n        \"\u76f4\u7403\u9009\u624b\",\n        \"\u9700\u8981\u4e2a\u4eba\u7a7a\u95f4\",\n        \"\u70ed\u60c5\u7684\u4f53\u9a8c\u6d3e\",\n        \"\u6e34\u671b\u88ab\u7406\u89e3\"\n      ],\n      \"desc\": \"\u6211\u8fd8\u6ca1\u8bf4\u5b8c\u5450...\",\n      \"matchScores\": [\n        {\n          \"key\": \"INFP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENFP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"INFJ\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ENFJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"INTJ\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ENTJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"INTP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENTP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ISFP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ESFP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ISTP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ESTP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ISFJ\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ESFJ\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ISTJ\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ESTJ\",\n          \"matchScore\": 70\n        }\n      ]\n    },\n    {\n      \"key\": \"ISFJ\",\n      \"character\": \"\u5b88\u536b\u8005\",\n      \"pic\": \"https://auto.tancdn.com/v1/images/eyJpZCI6IlhBNExTUVpJU05MS1pQVUhQTkNVTVhFUExCM0hEUzE0IiwidyI6MTgwLCJoIjoxODAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4MjAxMzcwMDQ1MTUwNzEyODc5fQ.png\",\n      \"labels\": [\n        \"\u5b89\u7a33\u800c\u4f53\u8d34\u7684\u7231\u60c5\",\n        \"\u5c0a\u91cd\u4f34\u4fa3\u60f3\u6cd5\",\n        \"\u6697\u604b\u578b\u9009\u624b\",\n        \"\u4eea\u5f0f\u611f\u6ee1\u5206\",\n        \"\u5ff5\u65e7\"\n      ],\n      \"desc\": \"\u70b9\u71c3\u6211\uff0c\u6e29\u6696\u4f60\u3002\",\n      \"matchScores\": [\n        {\n          \"key\": \"INFP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ENFP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"INFJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ENFJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"INTJ\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ENTJ\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"INTP\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ENTP\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ISFP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ESFP\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ISTP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ESTP\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ISFJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ESFJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ISTJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ESTJ\",\n          \"matchScore\": 90\n        }\n      ]\n    },\n    {\n      \"key\": \"ESFJ\",\n      \"character\": \"\u6267\u653f\u5b98\",\n      \"pic\": \"https://auto.tancdn.com/v1/images/eyJpZCI6IlRMUjI1UEJaR1NUTk42TEIyS0I3STdRMjIzV083NzE0IiwidyI6MTgwLCJoIjoxODAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4MTM0MjYyMjIwNjI3MTQ1MjY3fQ.png\",\n      \"labels\": [\n        \"\u6cbb\u6108\u7cfb\u604b\u4eba\",\n        \"\u7a9d\u5fc3\u5c0f\u592a\u9633\",\n        \"\u5bb9\u6613\u5fc3\u8f6f\",\n        \"\u7231\u90fd\u5728\u884c\u52a8\u91cc\",\n        \"\u5f88\u4f1a\u7167\u987e\u4eba\"\n      ],\n      \"desc\": \"\u9001\u4f60\u4e00\u6735\u5c0f\u7ea2\u82b1\uff0c\u963f\u5f25\u9640\u4f5b\u4e48\u4e48\u54d2\u3002\",\n      \"matchScores\": [\n        {\n          \"key\": \"INFP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ENFP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"INFJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ENFJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"INTJ\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ENTJ\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"INTP\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ENTP\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ISFP\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ESFP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ISTP\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ESTP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ISFJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ESFJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ISTJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ESTJ\",\n          \"matchScore\": 90\n        }\n      ]\n    },\n    {\n      \"key\": \"ESFP\",\n      \"character\": \"\u8868\u6f14\u8005\",\n      \"pic\": \"https://auto.tancdn.com/v1/images/eyJpZCI6Ik1HUlRUTDVIMlpSWVhTVE8zQ0lZSVdFTDNJSTVLNjE0IiwidyI6MTgwLCJoIjoxODAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMTQ4Nzc2MzQxOTkwMTcxMTg3fQ.png\",\n      \"labels\": [\n        \"\u6bcf\u5929\u90fd\u50cf\u70ed\u604b\",\n        \"\u9017\u53e6\u4e00\u534a\u5f00\u5fc3\",\n        \"\u604b\u7231\u8282\u594f\u5feb\",\n        \"\u559c\u6b22\u60ca\u559c\",\n        \"\u5bb9\u6613\u8ba9\u53e6\u4e00\u534a\u5403\u918b\"\n      ],\n      \"desc\": \"\u4eca\u671d\u6709\u9152\u4eca\u671d\u9189\u3002\",\n      \"matchScores\": [\n        {\n          \"key\": \"INFP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ENFP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"INFJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ENFJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"INTJ\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ENTJ\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"INTP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ENTP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ISFP\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ESFP\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ISTP\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ESTP\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ISFJ\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ESFJ\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ISTJ\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ESTJ\",\n          \"matchScore\": 80\n        }\n      ]\n    },\n    {\n      \"key\": \"ENFJ\",\n      \"character\": \"\u4e3b\u4eba\u516c\",\n      \"pic\": \"https://auto.tancdn.com/v1/images/eyJpZCI6IktYSjJNVTJBSExBNlpLQlRRUktKSVBFWE1UNjRYRDE0IiwidyI6MTgwLCJoIjoxODAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo2MjM4Nzk0MzYxODc2NTM3OTU1fQ.png\",\n      \"labels\": [\n        \"\u52aa\u529b\u4ed8\u51fa\u578b\",\n        \"\u5f88\u4f1a\u7167\u987e\u5bf9\u8c61\",\n        \"\u5171\u60c5\u529b\u5f3a\",\n        \"\u4e3b\u52a8\u5206\u4eab\u65e5\u5e38\",\n        \"\u638c\u63a7\u6b32\u5f3a\"\n      ],\n      \"desc\": \"\u4f60\u597d\uff0c\u9700\u8981\u5e2e\u5fd9\u5417\uff1f\",\n      \"matchScores\": [\n        {\n          \"key\": \"INFP\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ENFP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"INFJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENFJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"INTJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENTJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"INTP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENTP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ISFP\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ESFP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ISTP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ESTP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ISFJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ESFJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ISTJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ESTJ\",\n          \"matchScore\": 60\n        }\n      ]\n    },\n    {\n      \"key\": \"ESTJ\",\n      \"character\": \"\u603b\u7ecf\u7406\",\n      \"pic\": \"https://auto.tancdn.com/v1/images/eyJpZCI6IlVXVDcyMlpBWFZUV0lPSktGVVhGU01WRlJJU1hRQTE0IiwidyI6MTgwLCJoIjoxODAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4NzcxMTc0MTIzNzMyNzUxODkzfQ.png\",\n      \"labels\": [\n        \"\u611f\u60c5\u4e3b\u5bfc\u8005\",\n        \"\u4fdd\u62a4\u6b32\",\n        \"\u7406\u6027\u6d3e\",\n        \"\u8d23\u4efb\u611f\u5f3a\",\n        \"\u5bb9\u6613\u5fc3\u8f6f\"\n      ],\n      \"desc\": \"\u6211\u4e0d\u8981\u4f60\u89c9\u5f97\uff0c\u6211\u5c31\u8981\u6211\u89c9\u5f97\u3002\",\n      \"matchScores\": [\n        {\n          \"key\": \"INFP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ENFP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"INFJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ENFJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"INTJ\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ENTJ\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"INTP\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ENTP\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ISFP\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ESFP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ISTP\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ESTP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ISFJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ESFJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ISTJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ESTJ\",\n          \"matchScore\": 90\n        }\n      ]\n    },\n    {\n      \"key\": \"ISFP\",\n      \"character\": \"\u5192\u9669\u5bb6\",\n      \"pic\": \"https://auto.tancdn.com/v1/images/eyJpZCI6IjcyUEIzSlRYTEJNWDJWRk1CUEZVSUxLNUpLWUJQSzE0IiwidyI6MTgwLCJoIjoxODAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMjY2MzU1OTQyMzI3NTk3MTEzfQ.png\",\n      \"labels\": [\n        \"\u5916\u51b7\u5185\u70ed\",\n        \"\u604b\u7231\u9700\u8981\u4e3b\u5bfc\u6743\",\n        \"\u611f\u89c9\u6d3e\u4ee3\u8868\",\n        \"\u4e0d\u8bf4\u751c\u8a00\u871c\u8bed\",\n        \"\u7528\u884c\u52a8\u8868\u8fbe\u7231\"\n      ],\n      \"desc\": \"\u7231\uff0c\u662f\u6211\u505a\u8fc7\u6700\u52c7\u6562\u7684\u4e8b\u3002\",\n      \"matchScores\": [\n        {\n          \"key\": \"INFP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ENFP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"INFJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ENFJ\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"INTJ\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ENTJ\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"INTP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ENTP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ISFP\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ESFP\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ISTP\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ESTP\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ISFJ\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ESFJ\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ISTJ\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ESTJ\",\n          \"matchScore\": 100\n        }\n      ]\n    },\n    {\n      \"key\": \"ESTP\",\n      \"character\": \"\u4f01\u4e1a\u5bb6\",\n      \"pic\": \"https://auto.tancdn.com/v1/images/eyJpZCI6IjVBT1RIUURSNEY1WUZUVE01UE1FMlZHQjVETkE0UjE0IiwidyI6MTgwLCJoIjoxODAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyNzE5MjUyMTcyODczOTQ5NzcxfQ.png\",\n      \"labels\": [\n        \"\u7231\u4f60\u8981\u8ba9\u4f60\u77e5\u9053\",\n        \"\u70ed\u60c5\u4e3b\u52a8\",\n        \"\u559c\u6b22\u65b0\u9c9c\u611f\",\n        \"\u771f\u8bda\u4e14\u76f4\u63a5\",\n        \"\u7231\u7ba1\u5bf9\u65b9\"\n      ],\n      \"desc\": \"\u95ee\u9898\u4e0d\u5927\u3002\",\n      \"matchScores\": [\n        {\n          \"key\": \"INFP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ENFP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"INFJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ENFJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"INTJ\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ENTJ\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"INTP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ENTP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ISFP\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ESFP\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ISTP\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ESTP\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ISFJ\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ESFJ\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ISTJ\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ESTJ\",\n          \"matchScore\": 80\n        }\n      ]\n    },\n    {\n      \"key\": \"INFP\",\n      \"character\": \"\u8c03\u505c\u8005\",\n      \"pic\": \"https://auto.tancdn.com/v1/images/eyJpZCI6Ik9GR0VaRFlYUEJJNTdISU9DRzdaWElMRERJUklIWDE0IiwidyI6MTgwLCJoIjoxODAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3MzI0Mzg5NzE3OTA3NjI4NTkzfQ.png\",\n      \"labels\": [\n        \"\u6d6a\u6f2b\u4e3b\u4e49\u8005\",\n        \"\u559c\u6b22\u5c0f\u60ca\u559c\",\n        \"\u8ffd\u6c42\u5fc3\u7075\u7684\u5951\u5408\",\n        \"\u4ed8\u51fa\u578b\u4eba\u683c\",\n        \"\u5bb9\u6613\u80e1\u601d\u4e71\u60f3\"\n      ],\n      \"desc\": \"\u4efb\u4f55\u4e8b\u90fd\u6709\u597d\u7684\u4e00\u9762\u3002\",\n      \"matchScores\": [\n        {\n          \"key\": \"INFP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENFP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"INFJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENFJ\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"INTJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENTJ\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"INTP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENTP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ISFP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ESFP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ISTP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ESTP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ISFJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ESFJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ISTJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ESTJ\",\n          \"matchScore\": 60\n        }\n      ]\n    },\n    {\n      \"key\": \"ENTJ\",\n      \"character\": \"\u6307\u6325\u5b98\",\n      \"pic\": \"https://auto.tancdn.com/v1/images/eyJpZCI6IkU2VFIyNVpLSkpKWVJZUUhKNTVaSlFOUDRYVTdBVDE0IiwidyI6MTgwLCJoIjoxODAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3NjM2MDU3MzE4MzA4OTk3NzM5fQ.png\",\n      \"labels\": [\n        \"\u611f\u60c5\u4e3b\u5bfc\u8005\",\n        \"\u671f\u5f85\u5171\u540c\u6210\u957f\",\n        \"\u91cd\u89c6\u627f\u8bfa\",\n        \"\u4eab\u53d7\u88ab\u5d07\u62dc\",\n        \"\u7ba1\u8d85\u591a\"\n      ],\n      \"desc\": \"\u505c\u505c\u505c\uff0c\u7ed9\u6211\u91cd\u6765\uff01\",\n      \"matchScores\": [\n        {\n          \"key\": \"INFP\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ENFP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"INFJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENFJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"INTJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ENTJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"INTP\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ENTP\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ISFP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ESFP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ISTP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ESTP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ISFJ\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ESFJ\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ISTJ\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ESTJ\",\n          \"matchScore\": 80\n        }\n      ]\n    },\n    {\n      \"key\": \"ISTJ\",\n      \"character\": \"\u7269\u6d41\u5e08\",\n      \"pic\": \"https://auto.tancdn.com/v1/images/eyJpZCI6IjVDQ0JQTlNPVzRCRlFUSlY2NlNETDNGSlRMTjIzVTE0IiwidyI6MTgwLCJoIjoxODAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNzE2NTExMzQ2MjgyMDkzNjY3fQ.png\",\n      \"labels\": [\n        \"\u7231\u60c5\u5fe0\u8bda\u8005\",\n        \"\u5411\u5f80\u5b89\u7a33\u7684\u604b\u7231\",\n        \"\u4e0d\u592a\u4f1a\u8868\u8fbe\u611f\u60c5\",\n        \"\u8ba8\u538c\u82e5\u5373\u82e5\u79bb\",\n        \"\u5b88\u627f\u8bfa\"\n      ],\n      \"desc\": \"\u4e0d\u8fdf\u5230\uff0c\u662f\u6211\u6700\u540e\u7684\u6e29\u67d4\u3002\",\n      \"matchScores\": [\n        {\n          \"key\": \"INFP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ENFP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"INFJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ENFJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"INTJ\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ENTJ\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"INTP\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ENTP\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ISFP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ESFP\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ISTP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ESTP\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ISFJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ESFJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ISTJ\",\n          \"matchScore\": 90\n        },\n        {\n          \"key\": \"ESTJ\",\n          \"matchScore\": 90\n        }\n      ]\n    },\n    {\n      \"key\": \"ISTP\",\n      \"character\": \"\u9274\u8d4f\u5bb6\",\n      \"pic\": \"https://auto.tancdn.com/v1/images/eyJpZCI6IldQWk9OUDY3VUhGNFhSVERBS1BaTVBFTVpGUFVRRDE0IiwidyI6MTgwLCJoIjoxODAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMTQxNDcwMTQ3MjAxNzUyMTcxfQ.png\",\n      \"labels\": [\n        \"\u604b\u7231\u8ffd\u6c42\u5feb\u4e50\",\n        \"\u6e34\u671b\u7a33\u5b9a\",\n        \"\u72ec\u7acb\",\n        \"\u9700\u8981\u88ab\u54c4\",\n        \"\u4e0d\u64c5\u957f\u8bf4\u7231\"\n      ],\n      \"desc\": \"\u73b0\u5b9e\u662f\u4ec0\u4e48\uff1f\u5b83\u53ea\u662f\u7406\u8bba\u7684\u8bc1\u660e\u3002\",\n      \"matchScores\": [\n        {\n          \"key\": \"INFP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ENFP\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"INFJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"ENFJ\",\n          \"matchScore\": 60\n        },\n        {\n          \"key\": \"INTJ\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ENTJ\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"INTP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ENTP\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ISFP\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ESFP\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ISTP\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ESTP\",\n          \"matchScore\": 70\n        },\n        {\n          \"key\": \"ISFJ\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ESFJ\",\n          \"matchScore\": 100\n        },\n        {\n          \"key\": \"ISTJ\",\n          \"matchScore\": 80\n        },\n        {\n          \"key\": \"ESTJ\",\n          \"matchScore\": 100\n        }\n      ]\n    }\n  ]\n}"

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/p1/mobile/putong/core/data/MbtiConfig;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    sget-object v3, Lcom/p1/mobile/putong/core/data/MbtiConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 34
    .line 35
    invoke-virtual {v2, v0, v3}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lcom/p1/mobile/putong/core/data/MbtiConfig;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catch_0
    move-object v0, v1

    .line 43
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_2

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MbtiConfig;->mbtis:Ljava/util/List;

    .line 50
    .line 51
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_2

    .line 56
    .line 57
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-eqz v2, :cond_2

    .line 66
    .line 67
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    check-cast v2, Lcom/p1/mobile/putong/core/data/MbtiInfo;

    .line 72
    .line 73
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/MbtiInfo;->key:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {p0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    if-eqz v3, :cond_1

    .line 80
    .line 81
    return-object v2

    .line 82
    :cond_2
    return-object v1
.end method
