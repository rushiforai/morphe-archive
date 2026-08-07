.class public Ll/vqn0$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/vqn0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# static fields
.field private static final INSTANCE:Ll/vqn0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/vqn0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/vqn0;-><init>(Ll/wqn0;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/vqn0$c;->INSTANCE:Ll/vqn0;

    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic a()Ll/vqn0;
    .locals 1

    .line 1
    sget-object v0, Ll/vqn0$c;->INSTANCE:Ll/vqn0;

    return-object v0
.end method
