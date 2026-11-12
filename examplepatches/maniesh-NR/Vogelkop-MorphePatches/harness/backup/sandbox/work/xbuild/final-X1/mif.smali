.class public final synthetic Lmif;
.super Lnr9;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# static fields
.field public static final synthetic a:I


# direct methods
.method public constructor <init>()V
    .registers 7

    const-string v4, "getInstallationId()Ljava/lang/String;"

    const/4 v5, 0x0

    const/4 v1, 0x0

    const-class v2, Ltz5;

    const-string v3, "getInstallationId"

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lnr9;-><init>(ILjava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 1

    invoke-static {}, Ltz5;->b()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
