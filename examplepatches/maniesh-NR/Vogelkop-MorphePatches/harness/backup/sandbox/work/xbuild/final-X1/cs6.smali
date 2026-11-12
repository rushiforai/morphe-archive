.class public final Lcs6;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Lnak;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lrlh;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lxjc;->a:Lxjc;

    invoke-static {v0}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v0

    sput-object v0, Lcs6;->c:Lnak;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lix5;Ldeg;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcs6;->a:Landroid/content/Context;

    sget-object p1, Lcs6;->c:Lnak;

    invoke-static {p1}, La26;->j(Lnak;)Lrlh;

    move-result-object p1

    iput-object p1, p0, Lcs6;->b:Lrlh;

    sput-object p2, Lcom/opera/android/live_score/LiveCommentaryService;->o:Lix5;

    sput-object p3, Lcom/opera/android/live_score/LiveCommentaryService;->p:Ldeg;

    return-void
.end method
