.class public Ll/n9$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/n9;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field private static final INSTANCE:Ll/n9;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/n9;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/n9;-><init>(Ll/o9;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/n9$a;->INSTANCE:Ll/n9;

    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic a()Ll/n9;
    .locals 1

    .line 1
    sget-object v0, Ll/n9$a;->INSTANCE:Ll/n9;

    return-object v0
.end method
