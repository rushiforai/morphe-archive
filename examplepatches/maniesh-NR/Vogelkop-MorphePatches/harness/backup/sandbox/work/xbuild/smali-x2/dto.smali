.class public final synthetic Ldto;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhko;


# instance fields
.field public final synthetic a:Llzo;

.field public final synthetic b:Lguo;

.field public final synthetic c:Lvvm;


# direct methods
.method public synthetic constructor <init>(Llzo;Lguo;Lvvm;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldto;->a:Llzo;

    iput-object p2, p0, Ldto;->b:Lguo;

    iput-object p3, p0, Ldto;->c:Lvvm;

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 3

    iget-object v0, p0, Ldto;->a:Llzo;

    invoke-virtual {v0}, Llzo;->d()V

    const/4 v0, 0x1

    iget-object v1, p0, Ldto;->b:Lguo;

    iput-boolean v0, v1, Lguo;->q:Z

    invoke-virtual {v1}, Lguo;->h()V

    iget-object p0, p0, Ldto;->c:Lvvm;

    invoke-virtual {p0}, Lvvm;->invoke()Ljava/lang/Object;

    return-void
.end method
