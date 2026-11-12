.class public final synthetic Lq4m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lr4m;

.field public final synthetic c:Lszb;


# direct methods
.method public synthetic constructor <init>(Lr4m;Lszb;B)V
    .registers 4

    iput-byte p3, p0, Lq4m;->a:B

    iput-object p1, p0, Lq4m;->b:Lr4m;

    iput-object p2, p0, Lq4m;->c:Lszb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 8

    iget-byte v0, p0, Lq4m;->a:B

    const/4 v1, 0x1

    iget-object v2, p0, Lq4m;->c:Lszb;

    iget-object p0, p0, Lq4m;->b:Lr4m;

    packed-switch v0, :pswitch_data_50

    iget-object v0, p0, Lr4m;->c:Lb0c;

    iput-object v2, v0, Lb0c;->f:Lszb;

    iput-byte v1, v0, Lb0c;->d:B

    invoke-virtual {v0}, Ln1;->v0()V

    iget-object v0, p0, Lr4m;->d:Lh5m;

    invoke-virtual {v0}, Lh5m;->a()V

    iget-object v0, p0, Lr4m;->f:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    invoke-virtual {p0, v0, v1}, Lr4m;->Z(Lb2l;I)V

    return-void

    :pswitch_20
    iget-object v0, p0, Lr4m;->b:Ly4m;

    iget-object v3, v0, Ly4m;->i:Lszb;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_42

    iput-object v2, v0, Ly4m;->i:Lszb;

    iget-object v3, v0, Ly4m;->d:Lv3m;

    iget-object v4, v3, Lv3m;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v5, "translate_web_pages_to_language"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/opera/android/settings/SettingsManager;->Y(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Lv3m;->i(Lszb;)V

    invoke-virtual {v0}, Ln1;->v0()V

    :cond_42
    iget-object v0, p0, Lr4m;->d:Lh5m;

    invoke-virtual {v0}, Lh5m;->a()V

    iget-object v0, p0, Lr4m;->f:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    invoke-virtual {p0, v0, v1}, Lr4m;->Z(Lb2l;I)V

    return-void

    nop

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_20
    .end packed-switch
.end method
