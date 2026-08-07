.class public final synthetic Ll/mp50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;

.field public final synthetic d:Lcom/p1/mobile/android/app/Act;

.field public final synthetic e:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mp50;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/mp50;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/mp50;->c:Lcom/p1/mobile/putong/data/User;

    iput-object p4, p0, Ll/mp50;->d:Lcom/p1/mobile/android/app/Act;

    iput-object p5, p0, Ll/mp50;->e:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/mp50;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/mp50;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/mp50;->c:Lcom/p1/mobile/putong/data/User;

    iget-object v3, p0, Ll/mp50;->d:Lcom/p1/mobile/android/app/Act;

    iget-object v4, p0, Ll/mp50;->e:Ll/x20;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/match/b;->a(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
