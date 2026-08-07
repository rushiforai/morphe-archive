.class public final Ll/wnd$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w4d0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/wnd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/w4d0<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# static fields
.field private static final INSTANCE:Ll/wnd$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/wnd$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/wnd$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/wnd$a;->INSTANCE:Ll/wnd$a;

    .line 7
    .line 8
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

.method public static bridge synthetic a()Ll/wnd$a;
    .locals 1

    .line 1
    sget-object v0, Ll/wnd$a;->INSTANCE:Ll/wnd$a;

    return-object v0
.end method


# virtual methods
.method public b(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic release(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/graphics/Bitmap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wnd$a;->b(Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
