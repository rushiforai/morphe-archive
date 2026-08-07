.class public Ll/y63$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/y63;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field private static final INSTANCE:Ll/y63;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/y63;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/y63;-><init>(Ll/z63;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/y63$a;->INSTANCE:Ll/y63;

    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic a()Ll/y63;
    .locals 1

    .line 1
    sget-object v0, Ll/y63$a;->INSTANCE:Ll/y63;

    return-object v0
.end method
