.class public final synthetic Ll/lb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcn/qqtheme/framework/wheelview/OnWheelChangedListener;


# instance fields
.field public final synthetic a:Ll/ob0;


# direct methods
.method public synthetic constructor <init>(Ll/ob0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lb0;->a:Ll/ob0;

    return-void
.end method


# virtual methods
.method public final onChanged(Lcn/qqtheme/framework/wheelview/WheelView;II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lb0;->a:Ll/ob0;

    invoke-static {p0, p1, p2, p3}, Ll/ob0;->c(Ll/ob0;Lcn/qqtheme/framework/wheelview/WheelView;II)V

    return-void
.end method
