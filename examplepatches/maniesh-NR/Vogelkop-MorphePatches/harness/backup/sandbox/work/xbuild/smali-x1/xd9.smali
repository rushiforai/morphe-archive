.class public final synthetic Lxd9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqwl;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lle9;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:J

.field public final synthetic e:Lvk2;

.field public final synthetic f:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(JLoi2;Lvk2;Lle9;Ljava/lang/String;)V
    .registers 8

    const/4 v0, 0x0

    iput-byte v0, p0, Lxd9;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p5, p0, Lxd9;->b:Lle9;

    iput-wide p1, p0, Lxd9;->d:J

    iput-object p6, p0, Lxd9;->c:Ljava/lang/String;

    iput-object p3, p0, Lxd9;->f:Ljava/lang/Object;

    iput-object p4, p0, Lxd9;->e:Lvk2;

    return-void
.end method

.method public synthetic constructor <init>(JLvk2;Lle9;Lre9;Ljava/lang/String;)V
    .registers 8

    .line 17
    const/4 v0, 0x1

    iput-byte v0, p0, Lxd9;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p4, p0, Lxd9;->b:Lle9;

    iput-object p6, p0, Lxd9;->c:Ljava/lang/String;

    iput-wide p1, p0, Lxd9;->d:J

    iput-object p5, p0, Lxd9;->f:Ljava/lang/Object;

    iput-object p3, p0, Lxd9;->e:Lvk2;

    return-void
.end method


# virtual methods
.method public final run()Lih4;
    .registers 11

    iget-byte v0, p0, Lxd9;->a:B

    iget-object v1, p0, Lxd9;->f:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_2c

    move-object v7, v1

    check-cast v7, Lre9;

    new-instance v2, Lfe9;

    iget-wide v3, p0, Lxd9;->d:J

    iget-object v5, p0, Lxd9;->e:Lvk2;

    iget-object v6, p0, Lxd9;->b:Lle9;

    iget-object v8, p0, Lxd9;->c:Ljava/lang/String;

    invoke-direct/range {v2 .. v8}, Lfe9;-><init>(JLvk2;Lle9;Lre9;Ljava/lang/String;)V

    return-object v2

    :pswitch_18
    move-object v6, v1

    check-cast v6, Loi2;

    iget-object v8, p0, Lxd9;->b:Lle9;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lge9;

    iget-wide v4, p0, Lxd9;->d:J

    iget-object v7, p0, Lxd9;->e:Lvk2;

    iget-object v9, p0, Lxd9;->c:Ljava/lang/String;

    invoke-direct/range {v3 .. v9}, Lge9;-><init>(JLoi2;Lvk2;Lle9;Ljava/lang/String;)V

    return-object v3

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method
