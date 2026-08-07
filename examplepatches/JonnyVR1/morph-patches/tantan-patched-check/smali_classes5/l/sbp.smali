.class public final synthetic Ll/sbp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;ILcom/p1/mobile/android/app/Act;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sbp;->a:Lcom/p1/mobile/putong/data/User;

    iput p2, p0, Ll/sbp;->b:I

    iput-object p3, p0, Ll/sbp;->c:Lcom/p1/mobile/android/app/Act;

    iput-boolean p4, p0, Ll/sbp;->d:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sbp;->a:Lcom/p1/mobile/putong/data/User;

    iget v1, p0, Ll/sbp;->b:I

    iget-object v2, p0, Ll/sbp;->c:Lcom/p1/mobile/android/app/Act;

    iget-boolean p0, p0, Ll/sbp;->d:Z

    check-cast p1, Lcom/p1/mobile/android/app/c;

    invoke-static {v0, v1, v2, p0, p1}, Ll/ubp;->a(Lcom/p1/mobile/putong/data/User;ILcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/android/app/c;)V

    return-void
.end method
