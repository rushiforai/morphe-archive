.class public Ll/lsj$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/lsj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field public static INSTANCE:Ll/lsj;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/lsj;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/lsj;-><init>(Ll/nsj;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/lsj$a;->INSTANCE:Ll/lsj;

    .line 8
    .line 9
    return-void
.end method
