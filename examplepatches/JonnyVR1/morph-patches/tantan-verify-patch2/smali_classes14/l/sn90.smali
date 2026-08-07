.class public final synthetic Ll/sn90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/xn90;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/xn90;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sn90;->a:Ll/xn90;

    iput-object p2, p0, Ll/sn90;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/sn90;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sn90;->a:Ll/xn90;

    iget-object v1, p0, Ll/sn90;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/sn90;->c:Ljava/lang/String;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, v1, p0, p1}, Ll/xn90;->l(Ll/xn90;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Boolean;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
