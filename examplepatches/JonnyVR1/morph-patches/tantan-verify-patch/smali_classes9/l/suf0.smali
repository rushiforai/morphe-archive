.class public final Ll/suf0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/text/SpannableStringBuilder;

.field public b:I

.field public c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/text/SpannableStringBuilder;ILjava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 5
    .line 6
    iput p2, p0, Ll/suf0;->b:I

    .line 7
    .line 8
    iput-object p3, p0, Ll/suf0;->c:Ljava/lang/Object;

    .line 9
    .line 10
    return-void
.end method

.method public static a()Ll/suf0;
    .locals 4

    .line 1
    new-instance v0, Ll/suf0;

    .line 2
    .line 3
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x0

    .line 10
    invoke-direct {v0, v1, v2, v3}, Ll/suf0;-><init>(Landroid/text/SpannableStringBuilder;ILjava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method
