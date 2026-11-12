.class public final synthetic Lkmk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltmk;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Lh1b;

.field public final synthetic h:Lzzh;


# direct methods
.method public synthetic constructor <init>(Ltmk;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh1b;Lzzh;B)V
    .registers 9

    iput-byte p8, p0, Lkmk;->a:B

    iput-object p1, p0, Lkmk;->b:Ltmk;

    iput-object p2, p0, Lkmk;->c:Ljava/lang/String;

    iput-object p3, p0, Lkmk;->d:Ljava/lang/String;

    iput-object p4, p0, Lkmk;->e:Ljava/lang/String;

    iput-object p5, p0, Lkmk;->f:Ljava/lang/String;

    iput-object p6, p0, Lkmk;->g:Lh1b;

    iput-object p7, p0, Lkmk;->h:Lzzh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 15

    iget-byte v0, p0, Lkmk;->a:B

    iget-object v1, p0, Lkmk;->h:Lzzh;

    iget-object v2, p0, Lkmk;->b:Ltmk;

    packed-switch v0, :pswitch_data_56

    move-object v4, p1

    check-cast v4, Ljava/lang/String;

    if-eqz v4, :cond_2f

    iget-object v10, v2, Ltmk;->b:Lshf;

    sget-object p1, Lenk;->a:Lenk;

    new-instance v11, Llmk;

    const/4 p1, 0x1

    invoke-direct {v11, v2, v1, p1}, Llmk;-><init>(Ltmk;Lzzh;B)V

    iget-object p1, v10, Lshf;->a:Ljava/lang/Object;

    check-cast p1, Lwth;

    new-instance v3, Lue9;

    const/4 v12, 0x0

    iget-object v5, p0, Lkmk;->c:Ljava/lang/String;

    iget-object v6, p0, Lkmk;->d:Ljava/lang/String;

    iget-object v7, p0, Lkmk;->e:Ljava/lang/String;

    iget-object v8, p0, Lkmk;->f:Ljava/lang/String;

    iget-object v9, p0, Lkmk;->g:Lh1b;

    invoke-direct/range {v3 .. v12}, Lue9;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh1b;Lshf;Llmk;B)V

    invoke-virtual {p1, v3}, Lwth;->w(Lcom/opera/api/Callback;)V

    :cond_2f
    return-void

    :pswitch_30
    move-object v5, p1

    check-cast v5, Ljava/lang/String;

    if-eqz v5, :cond_55

    iget-object v11, v2, Ltmk;->b:Lshf;

    sget-object p1, Lenk;->a:Lenk;

    new-instance v12, Llmk;

    const/4 p1, 0x0

    invoke-direct {v12, v2, v1, p1}, Llmk;-><init>(Ltmk;Lzzh;B)V

    iget-object p1, v11, Lshf;->a:Ljava/lang/Object;

    check-cast p1, Lwth;

    new-instance v4, Lue9;

    iget-object v6, p0, Lkmk;->c:Ljava/lang/String;

    iget-object v7, p0, Lkmk;->d:Ljava/lang/String;

    iget-object v8, p0, Lkmk;->e:Ljava/lang/String;

    iget-object v9, p0, Lkmk;->f:Ljava/lang/String;

    iget-object v10, p0, Lkmk;->g:Lh1b;

    invoke-direct/range {v4 .. v12}, Lue9;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh1b;Lshf;Llmk;)V

    invoke-virtual {p1, v4}, Lwth;->w(Lcom/opera/api/Callback;)V

    :cond_55
    return-void

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_30
    .end packed-switch
.end method
