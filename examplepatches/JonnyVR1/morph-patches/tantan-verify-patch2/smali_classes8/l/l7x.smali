.class public final synthetic Ll/l7x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/y7x;

.field public final synthetic b:Lv/VText;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/y7x;Lv/VText;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l7x;->a:Ll/y7x;

    iput-object p2, p0, Ll/l7x;->b:Lv/VText;

    iput p3, p0, Ll/l7x;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l7x;->a:Ll/y7x;

    iget-object v1, p0, Ll/l7x;->b:Lv/VText;

    iget p0, p0, Ll/l7x;->c:I

    invoke-static {v0, v1, p0}, Ll/y7x;->l(Ll/y7x;Lv/VText;I)V

    return-void
.end method
