package e.e.a;
public final class BikeRunModelTest {
    private static void check(boolean ok,String message) { if(!ok)throw new AssertionError(message); }
    public static void main(String[] args) {
        BikeRunModel m=new BikeRunModel(7);
        m.step(.02f); check(m.distance==0,"waiting must not scroll");
        m.tap(); check(m.velocity<0,"touch begins jump immediately");
        m.step(.02f); check(m.y<0 && m.distance>=7,"jump starts at increased speed");
        for(int n=0;n<60;n++)m.step(.02f);
        check(m.y==0&&!m.over,"jump lands safely on clear ground");
        m.hazards.add(new BikeRunModel.Hazard(110,40,40,false)); m.step(.01f); check(m.over,"obstacle collision ends round");
        m.tap(); check(!m.over&&m.hazards.isEmpty(),"retry clears old hazards");
        m.y=-100; m.hazards.add(new BikeRunModel.Hazard(110,40,40,false)); m.step(.01f); check(!m.over,"airborne rider clears obstacle");
        m.reset(); m.started=true; m.hazards.add(new BikeRunModel.Hazard(145,40,40,false)); m.step(.01f);
        check(!m.over,"visible front wheel grazing obstacle has horizontal tolerance");
        m.reset(); m.started=true; m.y=-35; m.hazards.add(new BikeRunModel.Hazard(110,40,40,false)); m.step(.01f);
        check(!m.over,"grazing obstacle top has vertical tolerance");
        m.reset(); m.started=true; m.hazards.add(new BikeRunModel.Hazard(100,140,0,true)); m.step(.03f);
        check(!m.over,"cliff edge allows last-moment jump");
        m.tap(); m.step(.02f); check(m.y<0&&!m.over,"jump during edge grace saves rider");
        m.reset(); m.started=true; m.hazards.add(new BikeRunModel.Hazard(100,140,0,true));
        for(int n=0;n<4;n++)m.step(.03f);
        check(!m.over && m.y>0,"gap starts visible fall without immediate death");
        m.hazards.clear();m.hazards.add(new BikeRunModel.Hazard(-500,2000,0,true));
        for(int n=0;n<30&&!m.over;n++)m.step(.03f);
        check(m.over && m.y>220,"deep fall ends round");
        m.reset(); m.started=true; m.y=-100; m.hazards.add(new BikeRunModel.Hazard(100,140,0,true)); m.step(.01f);
        check(!m.over,"airborne rider crosses gap");
        float distance=m.distance; m.step(0); check(m.distance==distance,"paused step does not progress");
        check(BikeRunModel.terrain(500)==0 && BikeRunModel.terrain(1100)<-60,"hill starts after flat opening");
        m.reset(); m.distance=630; check(m.slopeAt(120)<0,"uphill exists");
        m.distance=2330; check(m.slopeAt(120)>0,"downhill exists");
        m.reset(); m.started=true; m.spawn=100000;
        for(int n=0;n<140;n++) { m.step(.02f); check(m.y==0&&!m.over,"grounded rider follows continuous hills without falling"); }
        m.distance=630; float old=m.groundAt(120); m.tap(); m.step(.02f);
        float worldY=m.y+m.groundAt(120);
        check(Math.abs(worldY-(old+(-650+1600*.02f)*.02f))<.01f,"hill jump keeps continuous world height");
        for(int n=0;n<70;n++)m.step(.02f);
        check(m.y==0&&!m.over,"hill jump lands on changing terrain");
        m.reset(); m.spawn=100000; m.tap();
        for(int n=0;n<18;n++)m.step(.02f);
        float firstHeight=m.y; m.tap();
        check(m.velocity==BikeRunModel.JUMP,"second touch immediately starts airborne jump");
        m.step(.02f); float secondVelocity=m.velocity; m.tap();
        check(m.velocity==secondVelocity,"third touch cannot add another jump");
        for(int n=0;n<12;n++)m.step(.02f);
        check(m.y<firstHeight-90,"double jump reaches higher than single jump");
        for(int n=0;n<90;n++)m.step(.02f);
        check(m.y==0&&!m.over,"double jump lands safely");
        m.tap(); m.step(.02f); m.tap(); check(m.velocity==BikeRunModel.JUMP,"landing restores two jumps");
        // Identical tall obstacle: single jump fails, a timed double jump clears it.
        for(int attempt=0;attempt<2;attempt++) {
            m.reset(); m.spawn=100000;
            m.hazards.add(new BikeRunModel.Hazard(350,45,175,false)); m.tap();
            for(int n=0;n<60&&!m.over;n++) { if(attempt==1&&n==16)m.tap(); m.step(.02f); }
            check(m.over==(attempt==0),"tall obstacle requires and permits double jump");
        }
        for(int attempt=0;attempt<2;attempt++) {
            m.reset(); m.spawn=100000; m.hazards.add(new BikeRunModel.Hazard(145,BikeRunModel.START_SPEED*.95f,0,true)); m.tap();
            for(int n=0;n<65&&!m.over;n++) { if(attempt==1&&n==20)m.tap(); m.step(.02f); }
            check(m.over==(attempt==0),"wide gap requires and permits double jump");
        }
        boolean tall=false,wide=false;
        for(int seed=0;seed<100;seed++) {
            m=new BikeRunModel(seed*9973L);m.distance=2000;m.started=true;m.spawn=0;m.step(.01f);
            BikeRunModel.Hazard h=m.hazards.get(0);
            if(h.height>=165)tall=true;if(h.gap&&h.width>300)wide=true;
            check(m.spawn>=h.width+m.speed()*1.2f,"spawn spacing allows landing before next hazard");
        }
        check(tall&&wide,"generator includes both double-jump challenges");
        m.reset();m.started=true;m.spawn=100000;m.distance=3325;
        m.step(.02f);check(m.over,"vertical step cannot be ridden through without jumping");
        m.reset();m.started=true;m.spawn=100000;m.distance=3325;m.y=-125;
        m.step(.02f);check(!m.over,"airborne rider clears the rising step");
        m.reset();m.started=true;m.spawn=100000;m.distance=3845;
        m.step(.02f);check(m.y<0&&!m.over,"descending ledge starts a fall");
        boolean spikes=false;
        for(int seed=0;seed<100;seed++){m=new BikeRunModel(seed*9973L);m.started=true;m.spawn=0;m.step(.01f);spikes|=m.hazards.get(0).spikes;}
        check(spikes,"generator includes spikes");
        check(m.slopeAt(120)==0,"flat slope stable");
        m.distance=3329;check(Math.abs(m.slopeAt(120))<1,"vertical edge does not rotate rider upright");
        m.reset();float initial=m.speed();m.distance=4000;check(m.speed()>initial,"distance increases speed");
        for(int sample=0;sample<1500;sample++) {
            m=new BikeRunModel(sample*9973L);m.distance=sample*37;m.started=true;m.spawn=0;m.y=-300;
            m.step(.01f);
            check(!m.hazards.isEmpty(),"valid placement must be found across terrain phases");
            BikeRunModel.Hazard h=m.hazards.get(0);
            check(BikeRunModel.flatSpan(m.distance+h.x-240-m.speed()*.1f,m.distance+h.x+h.width+160+m.speed()*.1f),
                "approach, obstacle and landing stay level at every speed and terrain phase");
        }
        check(!BikeRunModel.flatSpan(3300,4300),"span detects internal steps even when endpoints match");
        check(BikeRunModel.terrain(1800)==-180 && BikeRunModel.terrain(3800)==-200,"higher terrain is applied");
        System.out.println("Model regression checks passed");
    }
}
