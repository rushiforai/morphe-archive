.class public final synthetic Ls5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lu50;

.field public final synthetic b:Lv50;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ljava/lang/String;

.field public final synthetic h:Ljava/lang/String;

.field public final synthetic i:Ljava/lang/String;

.field public final synthetic j:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lu50;Lv50;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls5f;->a:Lu50;

    iput-object p2, p0, Ls5f;->b:Lv50;

    iput-object p3, p0, Ls5f;->c:Ljava/lang/String;

    iput-object p4, p0, Ls5f;->d:Ljava/lang/String;

    iput-object p5, p0, Ls5f;->e:Ljava/lang/String;

    iput-object p6, p0, Ls5f;->f:Ljava/lang/String;

    iput-object p7, p0, Ls5f;->g:Ljava/lang/String;

    iput-object p8, p0, Ls5f;->h:Ljava/lang/String;

    iput-object p9, p0, Ls5f;->i:Ljava/lang/String;

    iput-object p10, p0, Ls5f;->j:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    check-cast p1, Lti0;

    iget-object p1, p1, Lti0;->a:Lsi0;

    const/4 v0, 0x0

    const/4 v1, 0x1

    iget-object v2, p0, Ls5f;->a:Lu50;

    invoke-virtual {p1, v0, v1, v2}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object v0, p0, Ls5f;->b:Lv50;

    if-eqz v0, :cond_12

    invoke-virtual {p1, v1, v1, v0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_12
    const/4 v0, 0x2

    iget-object v1, p0, Ls5f;->c:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lsi0;->x(ILjava/lang/String;)V

    const/4 v0, 0x3

    iget-object v1, p0, Ls5f;->d:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lsi0;->x(ILjava/lang/String;)V

    const/4 v0, 0x4

    iget-object v1, p0, Ls5f;->e:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lsi0;->x(ILjava/lang/String;)V

    iget-object v0, p0, Ls5f;->f:Ljava/lang/String;

    if-eqz v0, :cond_2c

    const/4 v1, 0x5

    invoke-virtual {p1, v1, v0}, Lsi0;->x(ILjava/lang/String;)V

    :cond_2c
    iget-object v0, p0, Ls5f;->g:Ljava/lang/String;

    if-eqz v0, :cond_34

    const/4 v1, 0x6

    invoke-virtual {p1, v1, v0}, Lsi0;->x(ILjava/lang/String;)V

    :cond_34
    iget-object v0, p0, Ls5f;->h:Ljava/lang/String;

    if-eqz v0, :cond_3c

    const/4 v1, 0x7

    invoke-virtual {p1, v1, v0}, Lsi0;->x(ILjava/lang/String;)V

    :cond_3c
    iget-object v0, p0, Ls5f;->i:Ljava/lang/String;

    if-eqz v0, :cond_4b

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_4b

    const/16 v1, 0x8

    invoke-virtual {p1, v1, v0}, Lsi0;->x(ILjava/lang/String;)V

    :cond_4b
    iget-object p0, p0, Ls5f;->j:Ljava/lang/String;

    if-eqz p0, :cond_54

    const/16 v0, 0x9

    invoke-virtual {p1, v0, p0}, Lsi0;->x(ILjava/lang/String;)V

    :cond_54
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
