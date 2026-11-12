.class public final Leld;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrjg;


# instance fields
.field public final synthetic a:Ltjg;

.field public final synthetic b:Lgld;


# direct methods
.method public constructor <init>(Lgld;Ltjg;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Leld;->a:Ltjg;

    iput-object p1, p0, Leld;->b:Lgld;

    return-void
.end method


# virtual methods
.method public final d(Lsjg;)V
    .registers 2

    iget-object p1, p0, Leld;->a:Ltjg;

    invoke-virtual {p1, p0}, Ltjg;->i(Lrjg;)V

    const/4 p1, 0x1

    iget-object p0, p0, Leld;->b:Lgld;

    iput-boolean p1, p0, Lgld;->z:Z

    invoke-virtual {p0}, Lryl;->g0()V

    return-void
.end method
