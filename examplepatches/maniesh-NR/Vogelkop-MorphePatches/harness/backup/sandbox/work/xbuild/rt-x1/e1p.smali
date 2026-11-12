.class public final Le1p;
.super Lejo;
.source "SourceFile"


# instance fields
.field public final b:Landroid/content/Context;

.field public final c:Lmhk;

.field public final d:Ll0p;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lmhk;Ll0p;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le1p;->b:Landroid/content/Context;

    iput-object p2, p0, Le1p;->c:Lmhk;

    iput-object p3, p0, Le1p;->d:Ll0p;

    return-void
.end method


# virtual methods
.method public final h(Lpqo;Lg94;)V
    .registers 6

    new-instance v0, Lf0p;

    new-instance v1, Lkqo;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lkqo;-><init>(B)V

    invoke-direct {v0, p0, v1, p1, p2}, Lf0p;-><init>(Le1p;Lkqo;Lpqo;Lg94;)V

    iget-object p0, p0, Le1p;->b:Landroid/content/Context;

    invoke-static {p0, p1, v0}, Lphj;->s(Landroid/content/Context;Lpqo;Lejo;)V

    return-void
.end method
