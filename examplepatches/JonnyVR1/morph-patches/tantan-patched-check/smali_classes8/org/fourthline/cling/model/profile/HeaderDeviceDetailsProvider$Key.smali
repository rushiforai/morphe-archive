.class public Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider$Key;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Key"
.end annotation


# instance fields
.field final headerName:Ljava/lang/String;

.field final pattern:Ljava/util/regex/Pattern;

.field final valuePattern:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider$Key;->headerName:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider$Key;->valuePattern:Ljava/lang/String;

    .line 7
    .line 8
    const/4 p1, 0x2

    .line 9
    invoke-static {p2, p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider$Key;->pattern:Ljava/util/regex/Pattern;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public getHeaderName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider$Key;->headerName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getValuePattern()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider$Key;->valuePattern:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isValuePatternMatch(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider$Key;->pattern:Ljava/util/regex/Pattern;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
