.class public final synthetic Lzlo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhko;


# instance fields
.field public final synthetic a:Lny3;

.field public final synthetic b:Llzo;


# direct methods
.method public synthetic constructor <init>(Lny3;Llzo;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzlo;->a:Lny3;

    iput-object p2, p0, Lzlo;->b:Llzo;

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 3

    const/4 v0, 0x1

    iget-object v1, p0, Lzlo;->a:Lny3;

    iput-boolean v0, v1, Lny3;->b:Z

    iget-object p0, p0, Lzlo;->b:Llzo;

    invoke-virtual {p0}, Llzo;->d()V

    return-void
.end method
