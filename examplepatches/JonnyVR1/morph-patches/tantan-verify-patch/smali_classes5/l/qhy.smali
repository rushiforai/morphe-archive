.class public final synthetic Ll/qhy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:J

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ll/pej0;

.field public final synthetic f:Ll/y20;


# direct methods
.method public synthetic constructor <init>(ILcom/p1/mobile/android/app/Act;JLjava/lang/String;Ll/pej0;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/qhy;->a:I

    iput-object p2, p0, Ll/qhy;->b:Lcom/p1/mobile/android/app/Act;

    iput-wide p3, p0, Ll/qhy;->c:J

    iput-object p5, p0, Ll/qhy;->d:Ljava/lang/String;

    iput-object p6, p0, Ll/qhy;->e:Ll/pej0;

    iput-object p7, p0, Ll/qhy;->f:Ll/y20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 8

    .line 1
    iget v0, p0, Ll/qhy;->a:I

    iget-object v1, p0, Ll/qhy;->b:Lcom/p1/mobile/android/app/Act;

    iget-wide v2, p0, Ll/qhy;->c:J

    iget-object v4, p0, Ll/qhy;->d:Ljava/lang/String;

    iget-object v5, p0, Ll/qhy;->e:Ll/pej0;

    iget-object v6, p0, Ll/qhy;->f:Ll/y20;

    move-object v7, p1

    invoke-static/range {v0 .. v7}, Ll/why;->g(ILcom/p1/mobile/android/app/Act;JLjava/lang/String;Ll/pej0;Ll/y20;Landroid/view/View;)V

    return-void
.end method
