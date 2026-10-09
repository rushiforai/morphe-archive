.class public final Le/e/a/ContentFilterRules$Rule;
.super Ljava/lang/Object;
.source "ContentFilterRules.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ContentFilterRules;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Rule"
.end annotation


# instance fields
.field final enabled:Z

.field final mode:Ljava/lang/String;

.field final pattern:Ljava/util/regex/Pattern;

.field final value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 5

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Le/e/a/ContentFilterRules$Rule;->mode:Ljava/lang/String;

    iput-boolean p3, p0, Le/e/a/ContentFilterRules$Rule;->enabled:Z

    const-string p3, "regex"

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    move-object v0, p1

    goto :goto_15

    :cond_11
    # invokes: Le/e/a/ContentFilterRules;->normalized(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {p1}, Le/e/a/ContentFilterRules;->access$0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_15
    iput-object v0, p0, Le/e/a/ContentFilterRules$Rule;->value:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_22

    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p1

    goto :goto_23

    :cond_22
    const/4 p1, 0x0

    :goto_23
    iput-object p1, p0, Le/e/a/ContentFilterRules$Rule;->pattern:Ljava/util/regex/Pattern;

    return-void
.end method


# virtual methods
.method public matches(Ljava/lang/String;)Z
    .registers 4

    .line 9
    iget-boolean v0, p0, Le/e/a/ContentFilterRules$Rule;->enabled:Z

    if-eqz v0, :cond_32

    if-nez p1, :cond_7

    goto :goto_32

    :cond_7
    iget-object v0, p0, Le/e/a/ContentFilterRules$Rule;->pattern:Ljava/util/regex/Pattern;

    if-eqz v0, :cond_16

    iget-object v0, p0, Le/e/a/ContentFilterRules$Rule;->pattern:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result p1

    return p1

    :cond_16
    # invokes: Le/e/a/ContentFilterRules;->normalized(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {p1}, Le/e/a/ContentFilterRules;->access$0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Le/e/a/ContentFilterRules$Rule;->mode:Ljava/lang/String;

    const-string v1, "exact"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2b

    iget-object v0, p0, Le/e/a/ContentFilterRules$Rule;->value:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    goto :goto_31

    :cond_2b
    iget-object v0, p0, Le/e/a/ContentFilterRules$Rule;->value:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    :goto_31
    return p1

    :cond_32
    :goto_32
    const/4 p1, 0x0

    return p1
.end method
