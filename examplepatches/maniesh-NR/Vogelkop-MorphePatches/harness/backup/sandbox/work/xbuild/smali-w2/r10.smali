.class public final Lr10;
.super Ly55;
.source "SourceFile"


# instance fields
.field public final synthetic l:Ls10;


# direct methods
.method public constructor <init>(Ls10;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lr10;->l:Ls10;

    return-void
.end method


# virtual methods
.method public final o()V
    .registers 3

    iget-object p0, p0, Lr10;->l:Ls10;

    iget-object v0, p0, Ls10;->j:Lp10;

    sget-object v1, Ln10;->d:Ln10;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-virtual {p0}, Ls10;->g0()V

    :cond_f
    return-void
.end method
