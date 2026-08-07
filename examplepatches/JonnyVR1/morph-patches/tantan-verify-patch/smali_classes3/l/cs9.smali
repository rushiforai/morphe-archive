.class public final synthetic Ll/cs9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/d;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Z

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/android/app/Act;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cs9;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iput-boolean p2, p0, Ll/cs9;->b:Z

    iput-object p3, p0, Ll/cs9;->c:Lcom/p1/mobile/android/app/Act;

    iput-boolean p4, p0, Ll/cs9;->d:Z

    iput-object p5, p0, Ll/cs9;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/cs9;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iget-boolean v1, p0, Ll/cs9;->b:Z

    iget-object v2, p0, Ll/cs9;->c:Lcom/p1/mobile/android/app/Act;

    iget-boolean v3, p0, Ll/cs9;->d:Z

    iget-object v4, p0, Ll/cs9;->e:Ljava/lang/String;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->Y(Lcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/android/app/Act;ZLjava/lang/String;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
