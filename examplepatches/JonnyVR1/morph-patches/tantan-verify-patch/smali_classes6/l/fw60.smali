.class public final synthetic Ll/fw60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w30$d;


# instance fields
.field public final synthetic a:Ll/vw60;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z

.field public final synthetic d:Lcom/p1/mobile/android/app/Act;

.field public final synthetic e:Lcom/p1/mobile/putong/data/User;

.field public final synthetic f:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/vw60;Ljava/lang/String;ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fw60;->a:Ll/vw60;

    iput-object p2, p0, Ll/fw60;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/fw60;->c:Z

    iput-object p4, p0, Ll/fw60;->d:Lcom/p1/mobile/android/app/Act;

    iput-object p5, p0, Ll/fw60;->e:Lcom/p1/mobile/putong/data/User;

    iput-object p6, p0, Ll/fw60;->f:Ll/x20;

    return-void
.end method


# virtual methods
.method public final a(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/fw60;->a:Ll/vw60;

    iget-object v1, p0, Ll/fw60;->b:Ljava/lang/String;

    iget-boolean v2, p0, Ll/fw60;->c:Z

    iget-object v3, p0, Ll/fw60;->d:Lcom/p1/mobile/android/app/Act;

    iget-object v4, p0, Ll/fw60;->e:Lcom/p1/mobile/putong/data/User;

    iget-object v5, p0, Ll/fw60;->f:Ll/x20;

    move-object v6, p1

    move-object v7, p2

    move v8, p3

    invoke-static/range {v0 .. v8}, Ll/vw60;->s(Ll/vw60;Ljava/lang/String;ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method
