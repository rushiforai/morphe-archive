.class public final synthetic Lpif;
.super Ld6h;
.source "SourceFile"


# static fields
.field public static final b:Lpif;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lpif;

    const-string v1, "getFeatureAvailability()Lcom/opera/android/live_score/LiveScoreFeatureAvailability;"

    const/4 v2, 0x0

    const-class v3, Lsnc;

    const-string v4, "featureAvailability"

    invoke-direct {v0, v3, v4, v1, v2}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lpif;->b:Lpif;

    return-void
.end method


# virtual methods
.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Lsnc;

    iget-object p0, p1, Lsnc;->g:Lxnc;

    return-object p0
.end method
