.class public Ll/fcp$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/fcp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field private static final INSTANCE:Ll/fcp;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/fcp;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/fcp;-><init>(Ll/gcp;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/fcp$a;->INSTANCE:Ll/fcp;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic a()Ll/fcp;
    .locals 1

    .line 1
    sget-object v0, Ll/fcp$a;->INSTANCE:Ll/fcp;

    return-object v0
.end method
