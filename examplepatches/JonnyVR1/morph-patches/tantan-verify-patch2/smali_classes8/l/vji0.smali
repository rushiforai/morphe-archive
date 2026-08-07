.class public final synthetic Ll/vji0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;


# instance fields
.field public final synthetic a:Ll/wji0;

.field public final synthetic b:Ll/xc00;

.field public final synthetic c:Lorg/json/JSONObject;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;


# direct methods
.method public synthetic constructor <init>(Ll/wji0;Ll/xc00;Lorg/json/JSONObject;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vji0;->a:Ll/wji0;

    iput-object p2, p0, Ll/vji0;->b:Ll/xc00;

    iput-object p3, p0, Ll/vji0;->c:Lorg/json/JSONObject;

    iput-object p4, p0, Ll/vji0;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/vji0;->e:Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;

    return-void
.end method


# virtual methods
.method public final a(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/vji0;->a:Ll/wji0;

    iget-object v1, p0, Ll/vji0;->b:Ll/xc00;

    iget-object v2, p0, Ll/vji0;->c:Lorg/json/JSONObject;

    iget-object v3, p0, Ll/vji0;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/vji0;->e:Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;

    move v5, p1

    move-object v6, p2

    invoke-static/range {v0 .. v6}, Ll/wji0;->S(Ll/wji0;Ll/xc00;Lorg/json/JSONObject;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    return-void
.end method
