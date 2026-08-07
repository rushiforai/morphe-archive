.class public final synthetic Ll/stx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/bvx;

.field public final synthetic b:Landroid/database/Cursor;


# direct methods
.method public synthetic constructor <init>(Ll/bvx;Landroid/database/Cursor;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/stx;->a:Ll/bvx;

    iput-object p2, p0, Ll/stx;->b:Landroid/database/Cursor;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/stx;->a:Ll/bvx;

    iget-object p0, p0, Ll/stx;->b:Landroid/database/Cursor;

    invoke-static {v0, p0}, Ll/bvx;->l(Ll/bvx;Landroid/database/Cursor;)V

    return-void
.end method
