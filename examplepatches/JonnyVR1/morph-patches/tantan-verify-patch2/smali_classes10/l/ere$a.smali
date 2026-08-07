.class public Ll/ere$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ere;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field public static a:Ll/ere;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/ere;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/ere;-><init>(Ll/fre;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/ere$a;->a:Ll/ere;

    .line 8
    .line 9
    return-void
.end method
