.class public final synthetic Ll/s880;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lv/VDraweeView;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lv/VDraweeView;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s880;->a:Lv/VDraweeView;

    iput-object p2, p0, Ll/s880;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/s880;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s880;->a:Lv/VDraweeView;

    iget-object v1, p0, Ll/s880;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/s880;->c:Ll/x20;

    invoke-static {v0, v1, p0}, Ll/t880;->b(Lv/VDraweeView;Ljava/lang/String;Ll/x20;)V

    return-void
.end method
