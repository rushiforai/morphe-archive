.class public final Ldse;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Lbse;


# instance fields
.field public final a:Lwnm;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lbse;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ldse;->b:Lbse;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lhte;)V
    .registers 13

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcse;->c:Lcse;

    new-instance v1, Lzbe;

    const/4 v2, 0x7

    invoke-direct {v1, v2}, Lzbe;-><init>(B)V

    const-string v2, "enable_newsfeed"

    invoke-static {p1, v2, v1}, Luyg;->e(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object p1

    new-instance v1, Lpo7;

    invoke-direct {v1, p2}, Lpo7;-><init>(Lno7;)V

    new-instance v2, Ls2;

    const/4 v8, 0x0

    const/16 v9, 0x11

    const/4 v3, 0x2

    sget-object v4, Ldse;->b:Lbse;

    const-class v5, Lbse;

    const-string v6, "calculateEnabled"

    const-string v7, "calculateEnabled(ZLcom/opera/android/news/NewsSettingsData;)Lcom/opera/android/news/push/NewsPushNotificationController$Enabled;"

    invoke-direct/range {v2 .. v9}, Ls2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-static {v0, p1, v1, v2}, Lxf8;->Y(Ljava/lang/Object;Lekc;Lekc;Lkotlin/jvm/functions/Function2;)Lwnm;

    move-result-object p1

    iput-object p1, p0, Ldse;->a:Lwnm;

    return-void
.end method
