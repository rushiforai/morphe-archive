.class public final synthetic Ll/tnb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lv/VText;

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lv/VText;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tnb;->a:Lv/VText;

    iput p2, p0, Ll/tnb;->b:I

    iput-object p3, p0, Ll/tnb;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tnb;->a:Lv/VText;

    iget v1, p0, Ll/tnb;->b:I

    iget-object p0, p0, Ll/tnb;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/vnb;->i1(Lv/VText;ILjava/lang/String;)V

    return-void
.end method
