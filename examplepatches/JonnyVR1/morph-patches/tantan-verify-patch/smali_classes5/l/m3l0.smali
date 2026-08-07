.class public final synthetic Ll/m3l0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/o3l0;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Ll/o3l0;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m3l0;->a:Ll/o3l0;

    iput-object p2, p0, Ll/m3l0;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/m3l0;->c:Ljava/lang/String;

    iput p4, p0, Ll/m3l0;->d:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/m3l0;->a:Ll/o3l0;

    iget-object v1, p0, Ll/m3l0;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/m3l0;->c:Ljava/lang/String;

    iget p0, p0, Ll/m3l0;->d:I

    check-cast p1, Lcom/p1/mobile/putong/facertification/RxFacertification$b;

    invoke-static {v0, v1, v2, p0, p1}, Ll/o3l0;->g(Ll/o3l0;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ILcom/p1/mobile/putong/facertification/RxFacertification$b;)V

    return-void
.end method
