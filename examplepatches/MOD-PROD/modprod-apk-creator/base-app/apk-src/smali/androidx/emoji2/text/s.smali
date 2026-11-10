.class public final Landroidx/emoji2/text/s;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:LF/d;


# instance fields
.field public final a:Landroidx/emoji2/text/j;

.field public b:I

.field public final c:Landroidx/emoji2/text/e;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, LF/d;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, LF/d;-><init>(I)V

    sput-object v0, Landroidx/emoji2/text/s;->d:LF/d;

    return-void
.end method

.method public constructor <init>(Landroidx/emoji2/text/j;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Landroidx/emoji2/text/s;->b:I

    new-instance v0, Landroidx/emoji2/text/e;

    invoke-direct {v0}, Landroidx/emoji2/text/e;-><init>()V

    iput-object v0, p0, Landroidx/emoji2/text/s;->c:Landroidx/emoji2/text/e;

    iput-object p1, p0, Landroidx/emoji2/text/s;->a:Landroidx/emoji2/text/j;

    return-void
.end method
