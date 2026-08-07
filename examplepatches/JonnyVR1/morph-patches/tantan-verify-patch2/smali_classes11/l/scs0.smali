.class public final synthetic Ll/scs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s26;


# static fields
.field public static final synthetic a:Ll/scs0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/scs0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/scs0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/scs0;->a:Ll/scs0;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 0

    .line 1
    sget-object p0, Ll/vrs0;->a:Lcom/google/android/gms/common/api/Api$ClientKey;

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0
.end method
