.class public final Ll/olm;
.super Ll/f2e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/olm$b;
    }
.end annotation


# static fields
.field public static final INSTANCE:Ll/olm;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/olm;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/olm;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/olm;->INSTANCE:Ll/olm;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/f2e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public createWorker()Ll/f2e0$a;
    .locals 2

    .line 1
    new-instance v0, Ll/olm$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/olm$b;-><init>(Ll/olm;Ll/olm$a;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method
