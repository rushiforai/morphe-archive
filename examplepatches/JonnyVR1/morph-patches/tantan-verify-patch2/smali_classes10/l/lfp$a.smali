.class public Ll/lfp$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/lfp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field public static a:Ll/lfp;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/lfp;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/lfp;-><init>(Ll/mfp;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/lfp$a;->a:Ll/lfp;

    .line 8
    .line 9
    return-void
.end method
