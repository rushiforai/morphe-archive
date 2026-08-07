.class public final synthetic Ll/xit0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/gjt0;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Ll/w8t0;

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Ll/gjt0;Landroid/view/View;Ll/w8t0;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xit0;->a:Ll/gjt0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/xit0;->b:Landroid/view/View;

    .line 7
    .line 8
    iput-object p3, p0, Ll/xit0;->c:Ll/w8t0;

    .line 9
    .line 10
    iput p4, p0, Ll/xit0;->d:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xit0;->a:Ll/gjt0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xit0;->b:Landroid/view/View;

    .line 4
    .line 5
    iget-object v2, p0, Ll/xit0;->c:Ll/w8t0;

    .line 6
    .line 7
    iget p0, p0, Ll/xit0;->d:I

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, p0}, Ll/gjt0;->zzp(Landroid/view/View;Ll/w8t0;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
