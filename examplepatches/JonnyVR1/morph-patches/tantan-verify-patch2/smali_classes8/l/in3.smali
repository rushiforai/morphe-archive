.class public final synthetic Ll/in3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lkotlin/jvm/functions/Function0;

.field public final synthetic d:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/in3;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/in3;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/in3;->c:Lkotlin/jvm/functions/Function0;

    iput-object p4, p0, Ll/in3;->d:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final a(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/in3;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/in3;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/in3;->c:Lkotlin/jvm/functions/Function0;

    iget-object v3, p0, Ll/in3;->d:Lkotlin/jvm/functions/Function0;

    move v4, p1

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Ll/qn3;->d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    return-void
.end method
