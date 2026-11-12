.class public final synthetic Law3;
.super Lnr9;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# static fields
.field public static final a:Law3;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Law3;

    const-string v4, "isConnected()Z"

    const/4 v5, 0x0

    const/4 v1, 0x0

    const-class v2, Lipe;

    const-string v3, "isConnected"

    invoke-direct/range {v0 .. v5}, Lnr9;-><init>(ILjava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Law3;->a:Law3;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 1

    invoke-static {}, Lsle;->d()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
