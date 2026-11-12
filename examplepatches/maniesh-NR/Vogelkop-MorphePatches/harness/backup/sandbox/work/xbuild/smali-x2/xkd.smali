.class public final Lxkd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrjg;


# instance fields
.field public final synthetic a:Lzkd;


# direct methods
.method public constructor <init>(Lzkd;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxkd;->a:Lzkd;

    return-void
.end method


# virtual methods
.method public final e()V
    .registers 1

    iget-object p0, p0, Lxkd;->a:Lzkd;

    invoke-virtual {p0}, Lzkd;->T()V

    return-void
.end method
