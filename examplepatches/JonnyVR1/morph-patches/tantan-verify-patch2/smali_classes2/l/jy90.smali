.class public final synthetic Ll/jy90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroidx/profileinstaller/c$c;

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroidx/profileinstaller/c$c;ILjava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jy90;->a:Landroidx/profileinstaller/c$c;

    iput p2, p0, Ll/jy90;->b:I

    iput-object p3, p0, Ll/jy90;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jy90;->a:Landroidx/profileinstaller/c$c;

    iget v1, p0, Ll/jy90;->b:I

    iget-object p0, p0, Ll/jy90;->c:Ljava/lang/Object;

    invoke-static {v0, v1, p0}, Landroidx/profileinstaller/c;->a(Landroidx/profileinstaller/c$c;ILjava/lang/Object;)V

    return-void
.end method
